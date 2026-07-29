# Explore: explore_1692
# Auto-generated LookML Explore File

include: "/views/domain_27/view_05077.view.lkml"
include: "/views/domain_29/view_05079.view.lkml"
include: "/views/domain_30/view_05080.view.lkml"
include: "/views/domain_31/view_05081.view.lkml"

explore: explore_1692 {
  label: "Explore Explore 1692"
  description: "Comprehensive analytics explore joining base view_05077 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05077
  
  always_filter: {
    filters: [view_05077.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05077.created_at_date: "7 days"]
    unless: [view_05077.id, view_05077.status]
  }

  join: view_05079 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05077.user_id} = ${view_05079.id} ;;
    required_joins: []
  }

  join: view_05080 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05077.account_id} = ${view_05080.account_id} ;;
    required_joins: [view_05079]
  }

  join: view_05081 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05077.category} = ${view_05081.category} ;;
  }

  access_filter: {
    field: view_05077.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05077.is_deleted} = false ;;
}
