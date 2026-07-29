# Explore: explore_1111
# Auto-generated LookML Explore File

include: "/views/domain_34/view_03334.view.lkml"
include: "/views/domain_36/view_03336.view.lkml"
include: "/views/domain_37/view_03337.view.lkml"
include: "/views/domain_38/view_03338.view.lkml"

explore: explore_1111 {
  label: "Explore Explore 1111"
  description: "Comprehensive analytics explore joining base view_03334 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03334
  
  always_filter: {
    filters: [view_03334.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03334.created_at_date: "7 days"]
    unless: [view_03334.id, view_03334.status]
  }

  join: view_03336 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03334.user_id} = ${view_03336.id} ;;
    required_joins: []
  }

  join: view_03337 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03334.account_id} = ${view_03337.account_id} ;;
    required_joins: [view_03336]
  }

  join: view_03338 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03334.category} = ${view_03338.category} ;;
  }

  access_filter: {
    field: view_03334.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03334.is_deleted} = false ;;
}
