# Explore: explore_2677
# Auto-generated LookML Explore File

include: "/views/domain_32/view_08032.view.lkml"
include: "/views/domain_34/view_08034.view.lkml"
include: "/views/domain_35/view_08035.view.lkml"
include: "/views/domain_36/view_08036.view.lkml"

explore: explore_2677 {
  label: "Explore Explore 2677"
  description: "Comprehensive analytics explore joining base view_08032 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08032
  
  always_filter: {
    filters: [view_08032.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08032.created_at_date: "7 days"]
    unless: [view_08032.id, view_08032.status]
  }

  join: view_08034 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08032.user_id} = ${view_08034.id} ;;
    required_joins: []
  }

  join: view_08035 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08032.account_id} = ${view_08035.account_id} ;;
    required_joins: [view_08034]
  }

  join: view_08036 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08032.category} = ${view_08036.category} ;;
  }

  access_filter: {
    field: view_08032.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08032.is_deleted} = false ;;
}
