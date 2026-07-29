# Explore: explore_0134
# Auto-generated LookML Explore File

include: "/views/domain_03/view_00403.view.lkml"
include: "/views/domain_05/view_00405.view.lkml"
include: "/views/domain_06/view_00406.view.lkml"
include: "/views/domain_07/view_00407.view.lkml"

explore: explore_0134 {
  label: "Explore Explore 0134"
  description: "Comprehensive analytics explore joining base view_00403 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00403
  
  always_filter: {
    filters: [view_00403.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00403.created_at_date: "7 days"]
    unless: [view_00403.id, view_00403.status]
  }

  join: view_00405 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00403.user_id} = ${view_00405.id} ;;
    required_joins: []
  }

  join: view_00406 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00403.account_id} = ${view_00406.account_id} ;;
    required_joins: [view_00405]
  }

  join: view_00407 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00403.category} = ${view_00407.category} ;;
  }

  access_filter: {
    field: view_00403.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00403.is_deleted} = false ;;
}
