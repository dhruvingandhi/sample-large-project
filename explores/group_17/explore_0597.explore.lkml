# Explore: explore_0597
# Auto-generated LookML Explore File

include: "/views/domain_42/view_01792.view.lkml"
include: "/views/domain_44/view_01794.view.lkml"
include: "/views/domain_45/view_01795.view.lkml"
include: "/views/domain_46/view_01796.view.lkml"

explore: explore_0597 {
  label: "Explore Explore 0597"
  description: "Comprehensive analytics explore joining base view_01792 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01792
  
  always_filter: {
    filters: [view_01792.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01792.created_at_date: "7 days"]
    unless: [view_01792.id, view_01792.status]
  }

  join: view_01794 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01792.user_id} = ${view_01794.id} ;;
    required_joins: []
  }

  join: view_01795 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01792.account_id} = ${view_01795.account_id} ;;
    required_joins: [view_01794]
  }

  join: view_01796 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01792.category} = ${view_01796.category} ;;
  }

  access_filter: {
    field: view_01792.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01792.is_deleted} = false ;;
}
