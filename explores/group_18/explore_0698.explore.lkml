# Explore: explore_0698
# Auto-generated LookML Explore File

include: "/views/domain_45/view_02095.view.lkml"
include: "/views/domain_47/view_02097.view.lkml"
include: "/views/domain_48/view_02098.view.lkml"
include: "/views/domain_49/view_02099.view.lkml"

explore: explore_0698 {
  label: "Explore Explore 0698"
  description: "Comprehensive analytics explore joining base view_02095 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02095
  
  always_filter: {
    filters: [view_02095.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02095.created_at_date: "7 days"]
    unless: [view_02095.id, view_02095.status]
  }

  join: view_02097 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02095.user_id} = ${view_02097.id} ;;
    required_joins: []
  }

  join: view_02098 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02095.account_id} = ${view_02098.account_id} ;;
    required_joins: [view_02097]
  }

  join: view_02099 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02095.category} = ${view_02099.category} ;;
  }

  access_filter: {
    field: view_02095.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02095.is_deleted} = false ;;
}
