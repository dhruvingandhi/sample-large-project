# Explore: explore_2892
# Auto-generated LookML Explore File

include: "/views/domain_27/view_08677.view.lkml"
include: "/views/domain_29/view_08679.view.lkml"
include: "/views/domain_30/view_08680.view.lkml"
include: "/views/domain_31/view_08681.view.lkml"

explore: explore_2892 {
  label: "Explore Explore 2892"
  description: "Comprehensive analytics explore joining base view_08677 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08677
  
  always_filter: {
    filters: [view_08677.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08677.created_at_date: "7 days"]
    unless: [view_08677.id, view_08677.status]
  }

  join: view_08679 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08677.user_id} = ${view_08679.id} ;;
    required_joins: []
  }

  join: view_08680 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08677.account_id} = ${view_08680.account_id} ;;
    required_joins: [view_08679]
  }

  join: view_08681 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08677.category} = ${view_08681.category} ;;
  }

  access_filter: {
    field: view_08677.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08677.is_deleted} = false ;;
}
