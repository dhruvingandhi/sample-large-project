# Antigravity modified: branch dg-3
# Explore: explore_0645
# Auto-generated LookML Explore File

include: "/views/domain_36/view_01936.view.lkml"
include: "/views/domain_38/view_01938.view.lkml"
include: "/views/domain_39/view_01939.view.lkml"
include: "/views/domain_40/view_01940.view.lkml"

explore: explore_0645 {
  label: "Explore Explore 0645"
  description: "Comprehensive analytics explore joining base view_01936 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01936
  
  always_filter: {
    filters: [view_01936.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01936.created_at_date: "7 days"]
    unless: [view_01936.id, view_01936.status]
  }

  join: view_01938 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01936.user_id} = ${view_01938.id} ;;
    required_joins: []
  }

  join: view_01939 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01936.account_id} = ${view_01939.account_id} ;;
    required_joins: [view_01938]
  }

  join: view_01940 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01936.category} = ${view_01940.category} ;;
  }

  access_filter: {
    field: view_01936.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01936.is_deleted} = false ;;
}
