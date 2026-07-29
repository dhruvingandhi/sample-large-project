# Explore: explore_0651
# Auto-generated LookML Explore File

include: "/views/domain_04/view_01954.view.lkml"
include: "/views/domain_06/view_01956.view.lkml"
include: "/views/domain_07/view_01957.view.lkml"
include: "/views/domain_08/view_01958.view.lkml"

explore: explore_0651 {
  label: "Explore Explore 0651"
  description: "Comprehensive analytics explore joining base view_01954 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01954
  
  always_filter: {
    filters: [view_01954.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01954.created_at_date: "7 days"]
    unless: [view_01954.id, view_01954.status]
  }

  join: view_01956 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01954.user_id} = ${view_01956.id} ;;
    required_joins: []
  }

  join: view_01957 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01954.account_id} = ${view_01957.account_id} ;;
    required_joins: [view_01956]
  }

  join: view_01958 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01954.category} = ${view_01958.category} ;;
  }

  access_filter: {
    field: view_01954.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01954.is_deleted} = false ;;
}
