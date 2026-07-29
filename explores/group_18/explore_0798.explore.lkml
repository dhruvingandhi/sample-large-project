# Explore: explore_0798
# Auto-generated LookML Explore File

include: "/views/domain_45/view_02395.view.lkml"
include: "/views/domain_47/view_02397.view.lkml"
include: "/views/domain_48/view_02398.view.lkml"
include: "/views/domain_49/view_02399.view.lkml"

explore: explore_0798 {
  label: "Explore Explore 0798"
  description: "Comprehensive analytics explore joining base view_02395 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02395
  
  always_filter: {
    filters: [view_02395.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02395.created_at_date: "7 days"]
    unless: [view_02395.id, view_02395.status]
  }

  join: view_02397 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02395.user_id} = ${view_02397.id} ;;
    required_joins: []
  }

  join: view_02398 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02395.account_id} = ${view_02398.account_id} ;;
    required_joins: [view_02397]
  }

  join: view_02399 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02395.category} = ${view_02399.category} ;;
  }

  access_filter: {
    field: view_02395.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02395.is_deleted} = false ;;
}
