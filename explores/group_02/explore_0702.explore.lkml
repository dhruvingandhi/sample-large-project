# Explore: explore_0702
# Auto-generated LookML Explore File

include: "/views/domain_07/view_02107.view.lkml"
include: "/views/domain_09/view_02109.view.lkml"
include: "/views/domain_10/view_02110.view.lkml"
include: "/views/domain_11/view_02111.view.lkml"

explore: explore_0702 {
  label: "Explore Explore 0702"
  description: "Comprehensive analytics explore joining base view_02107 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02107
  
  always_filter: {
    filters: [view_02107.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02107.created_at_date: "7 days"]
    unless: [view_02107.id, view_02107.status]
  }

  join: view_02109 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02107.user_id} = ${view_02109.id} ;;
    required_joins: []
  }

  join: view_02110 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02107.account_id} = ${view_02110.account_id} ;;
    required_joins: [view_02109]
  }

  join: view_02111 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02107.category} = ${view_02111.category} ;;
  }

  access_filter: {
    field: view_02107.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02107.is_deleted} = false ;;
}
