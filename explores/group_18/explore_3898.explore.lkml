# Explore: explore_3898
# Auto-generated LookML Explore File

include: "/views/domain_45/view_11695.view.lkml"
include: "/views/domain_47/view_11697.view.lkml"
include: "/views/domain_48/view_11698.view.lkml"
include: "/views/domain_49/view_11699.view.lkml"

explore: explore_3898 {
  label: "Explore Explore 3898"
  description: "Comprehensive analytics explore joining base view_11695 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11695
  
  always_filter: {
    filters: [view_11695.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11695.created_at_date: "7 days"]
    unless: [view_11695.id, view_11695.status]
  }

  join: view_11697 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11695.user_id} = ${view_11697.id} ;;
    required_joins: []
  }

  join: view_11698 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11695.account_id} = ${view_11698.account_id} ;;
    required_joins: [view_11697]
  }

  join: view_11699 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11695.category} = ${view_11699.category} ;;
  }

  access_filter: {
    field: view_11695.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11695.is_deleted} = false ;;
}
