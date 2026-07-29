# Explore: explore_2597
# Auto-generated LookML Explore File

include: "/views/domain_42/view_07792.view.lkml"
include: "/views/domain_44/view_07794.view.lkml"
include: "/views/domain_45/view_07795.view.lkml"
include: "/views/domain_46/view_07796.view.lkml"

explore: explore_2597 {
  label: "Explore Explore 2597"
  description: "Comprehensive analytics explore joining base view_07792 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07792
  
  always_filter: {
    filters: [view_07792.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07792.created_at_date: "7 days"]
    unless: [view_07792.id, view_07792.status]
  }

  join: view_07794 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07792.user_id} = ${view_07794.id} ;;
    required_joins: []
  }

  join: view_07795 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07792.account_id} = ${view_07795.account_id} ;;
    required_joins: [view_07794]
  }

  join: view_07796 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07792.category} = ${view_07796.category} ;;
  }

  access_filter: {
    field: view_07792.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07792.is_deleted} = false ;;
}
