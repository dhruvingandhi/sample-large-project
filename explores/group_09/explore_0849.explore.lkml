# Explore: explore_0849
# Auto-generated LookML Explore File

include: "/views/domain_48/view_02548.view.lkml"
include: "/views/domain_50/view_02550.view.lkml"
include: "/views/domain_01/view_02551.view.lkml"
include: "/views/domain_02/view_02552.view.lkml"

explore: explore_0849 {
  label: "Explore Explore 0849"
  description: "Comprehensive analytics explore joining base view_02548 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02548
  
  always_filter: {
    filters: [view_02548.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02548.created_at_date: "7 days"]
    unless: [view_02548.id, view_02548.status]
  }

  join: view_02550 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02548.user_id} = ${view_02550.id} ;;
    required_joins: []
  }

  join: view_02551 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02548.account_id} = ${view_02551.account_id} ;;
    required_joins: [view_02550]
  }

  join: view_02552 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02548.category} = ${view_02552.category} ;;
  }

  access_filter: {
    field: view_02548.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02548.is_deleted} = false ;;
}
