# Explore: explore_3932
# Auto-generated LookML Explore File

include: "/views/domain_47/view_11797.view.lkml"
include: "/views/domain_49/view_11799.view.lkml"
include: "/views/domain_50/view_11800.view.lkml"
include: "/views/domain_01/view_11801.view.lkml"

explore: explore_3932 {
  label: "Explore Explore 3932"
  description: "Comprehensive analytics explore joining base view_11797 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11797
  
  always_filter: {
    filters: [view_11797.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11797.created_at_date: "7 days"]
    unless: [view_11797.id, view_11797.status]
  }

  join: view_11799 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11797.user_id} = ${view_11799.id} ;;
    required_joins: []
  }

  join: view_11800 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11797.account_id} = ${view_11800.account_id} ;;
    required_joins: [view_11799]
  }

  join: view_11801 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11797.category} = ${view_11801.category} ;;
  }

  access_filter: {
    field: view_11797.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11797.is_deleted} = false ;;
}
