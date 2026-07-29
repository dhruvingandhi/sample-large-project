# Explore: explore_3809
# Auto-generated LookML Explore File

include: "/views/domain_28/view_11428.view.lkml"
include: "/views/domain_30/view_11430.view.lkml"
include: "/views/domain_31/view_11431.view.lkml"
include: "/views/domain_32/view_11432.view.lkml"

explore: explore_3809 {
  label: "Explore Explore 3809"
  description: "Comprehensive analytics explore joining base view_11428 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11428
  
  always_filter: {
    filters: [view_11428.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11428.created_at_date: "7 days"]
    unless: [view_11428.id, view_11428.status]
  }

  join: view_11430 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11428.user_id} = ${view_11430.id} ;;
    required_joins: []
  }

  join: view_11431 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11428.account_id} = ${view_11431.account_id} ;;
    required_joins: [view_11430]
  }

  join: view_11432 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11428.category} = ${view_11432.category} ;;
  }

  access_filter: {
    field: view_11428.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11428.is_deleted} = false ;;
}
