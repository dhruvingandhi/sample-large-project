# Explore: explore_0477
# Auto-generated LookML Explore File

include: "/views/domain_32/view_01432.view.lkml"
include: "/views/domain_34/view_01434.view.lkml"
include: "/views/domain_35/view_01435.view.lkml"
include: "/views/domain_36/view_01436.view.lkml"

explore: explore_0477 {
  label: "Explore Explore 0477"
  description: "Comprehensive analytics explore joining base view_01432 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01432
  
  always_filter: {
    filters: [view_01432.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01432.created_at_date: "7 days"]
    unless: [view_01432.id, view_01432.status]
  }

  join: view_01434 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01432.user_id} = ${view_01434.id} ;;
    required_joins: []
  }

  join: view_01435 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01432.account_id} = ${view_01435.account_id} ;;
    required_joins: [view_01434]
  }

  join: view_01436 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01432.category} = ${view_01436.category} ;;
  }

  access_filter: {
    field: view_01432.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01432.is_deleted} = false ;;
}
