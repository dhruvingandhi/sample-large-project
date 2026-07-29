# Explore: explore_0892
# Auto-generated LookML Explore File

include: "/views/domain_27/view_02677.view.lkml"
include: "/views/domain_29/view_02679.view.lkml"
include: "/views/domain_30/view_02680.view.lkml"
include: "/views/domain_31/view_02681.view.lkml"

explore: explore_0892 {
  label: "Explore Explore 0892"
  description: "Comprehensive analytics explore joining base view_02677 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02677
  
  always_filter: {
    filters: [view_02677.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02677.created_at_date: "7 days"]
    unless: [view_02677.id, view_02677.status]
  }

  join: view_02679 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02677.user_id} = ${view_02679.id} ;;
    required_joins: []
  }

  join: view_02680 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02677.account_id} = ${view_02680.account_id} ;;
    required_joins: [view_02679]
  }

  join: view_02681 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02677.category} = ${view_02681.category} ;;
  }

  access_filter: {
    field: view_02677.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02677.is_deleted} = false ;;
}
