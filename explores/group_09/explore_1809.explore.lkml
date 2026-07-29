# Explore: explore_1809
# Auto-generated LookML Explore File

include: "/views/domain_28/view_05428.view.lkml"
include: "/views/domain_30/view_05430.view.lkml"
include: "/views/domain_31/view_05431.view.lkml"
include: "/views/domain_32/view_05432.view.lkml"

explore: explore_1809 {
  label: "Explore Explore 1809"
  description: "Comprehensive analytics explore joining base view_05428 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05428
  
  always_filter: {
    filters: [view_05428.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05428.created_at_date: "7 days"]
    unless: [view_05428.id, view_05428.status]
  }

  join: view_05430 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05428.user_id} = ${view_05430.id} ;;
    required_joins: []
  }

  join: view_05431 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05428.account_id} = ${view_05431.account_id} ;;
    required_joins: [view_05430]
  }

  join: view_05432 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05428.category} = ${view_05432.category} ;;
  }

  access_filter: {
    field: view_05428.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05428.is_deleted} = false ;;
}
