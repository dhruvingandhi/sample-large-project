# Explore: explore_0132
# Auto-generated LookML Explore File

include: "/views/domain_47/view_00397.view.lkml"
include: "/views/domain_49/view_00399.view.lkml"
include: "/views/domain_50/view_00400.view.lkml"
include: "/views/domain_01/view_00401.view.lkml"

explore: explore_0132 {
  label: "Explore Explore 0132"
  description: "Comprehensive analytics explore joining base view_00397 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00397
  
  always_filter: {
    filters: [view_00397.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00397.created_at_date: "7 days"]
    unless: [view_00397.id, view_00397.status]
  }

  join: view_00399 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00397.user_id} = ${view_00399.id} ;;
    required_joins: []
  }

  join: view_00400 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00397.account_id} = ${view_00400.account_id} ;;
    required_joins: [view_00399]
  }

  join: view_00401 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00397.category} = ${view_00401.category} ;;
  }

  access_filter: {
    field: view_00397.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00397.is_deleted} = false ;;
}
