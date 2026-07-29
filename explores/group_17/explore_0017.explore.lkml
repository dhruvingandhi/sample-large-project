# Explore: explore_0017
# Auto-generated LookML Explore File

include: "/views/domain_02/view_00052.view.lkml"
include: "/views/domain_04/view_00054.view.lkml"
include: "/views/domain_05/view_00055.view.lkml"
include: "/views/domain_06/view_00056.view.lkml"

explore: explore_0017 {
  label: "Explore Explore 0017"
  description: "Comprehensive analytics explore joining base view_00052 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00052
  
  always_filter: {
    filters: [view_00052.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00052.created_at_date: "7 days"]
    unless: [view_00052.id, view_00052.status]
  }

  join: view_00054 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00052.user_id} = ${view_00054.id} ;;
    required_joins: []
  }

  join: view_00055 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00052.account_id} = ${view_00055.account_id} ;;
    required_joins: [view_00054]
  }

  join: view_00056 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00052.category} = ${view_00056.category} ;;
  }

  access_filter: {
    field: view_00052.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00052.is_deleted} = false ;;
}
