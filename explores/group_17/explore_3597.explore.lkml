# Explore: explore_3597
# Auto-generated LookML Explore File

include: "/views/domain_42/view_10792.view.lkml"
include: "/views/domain_44/view_10794.view.lkml"
include: "/views/domain_45/view_10795.view.lkml"
include: "/views/domain_46/view_10796.view.lkml"

explore: explore_3597 {
  label: "Explore Explore 3597"
  description: "Comprehensive analytics explore joining base view_10792 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10792
  
  always_filter: {
    filters: [view_10792.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10792.created_at_date: "7 days"]
    unless: [view_10792.id, view_10792.status]
  }

  join: view_10794 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10792.user_id} = ${view_10794.id} ;;
    required_joins: []
  }

  join: view_10795 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10792.account_id} = ${view_10795.account_id} ;;
    required_joins: [view_10794]
  }

  join: view_10796 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10792.category} = ${view_10796.category} ;;
  }

  access_filter: {
    field: view_10792.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10792.is_deleted} = false ;;
}
