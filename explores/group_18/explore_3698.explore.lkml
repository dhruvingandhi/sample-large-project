# Explore: explore_3698
# Auto-generated LookML Explore File

include: "/views/domain_45/view_11095.view.lkml"
include: "/views/domain_47/view_11097.view.lkml"
include: "/views/domain_48/view_11098.view.lkml"
include: "/views/domain_49/view_11099.view.lkml"

explore: explore_3698 {
  label: "Explore Explore 3698"
  description: "Comprehensive analytics explore joining base view_11095 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11095
  
  always_filter: {
    filters: [view_11095.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11095.created_at_date: "7 days"]
    unless: [view_11095.id, view_11095.status]
  }

  join: view_11097 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11095.user_id} = ${view_11097.id} ;;
    required_joins: []
  }

  join: view_11098 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11095.account_id} = ${view_11098.account_id} ;;
    required_joins: [view_11097]
  }

  join: view_11099 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11095.category} = ${view_11099.category} ;;
  }

  access_filter: {
    field: view_11095.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11095.is_deleted} = false ;;
}
