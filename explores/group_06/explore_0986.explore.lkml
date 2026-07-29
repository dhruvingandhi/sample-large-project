# Explore: explore_0986
# Auto-generated LookML Explore File

include: "/views/domain_09/view_02959.view.lkml"
include: "/views/domain_11/view_02961.view.lkml"
include: "/views/domain_12/view_02962.view.lkml"
include: "/views/domain_13/view_02963.view.lkml"

explore: explore_0986 {
  label: "Explore Explore 0986"
  description: "Comprehensive analytics explore joining base view_02959 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02959
  
  always_filter: {
    filters: [view_02959.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02959.created_at_date: "7 days"]
    unless: [view_02959.id, view_02959.status]
  }

  join: view_02961 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02959.user_id} = ${view_02961.id} ;;
    required_joins: []
  }

  join: view_02962 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02959.account_id} = ${view_02962.account_id} ;;
    required_joins: [view_02961]
  }

  join: view_02963 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02959.category} = ${view_02963.category} ;;
  }

  access_filter: {
    field: view_02959.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02959.is_deleted} = false ;;
}
