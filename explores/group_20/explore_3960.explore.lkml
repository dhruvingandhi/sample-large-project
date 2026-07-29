# Explore: explore_3960
# Auto-generated LookML Explore File

include: "/views/domain_31/view_11881.view.lkml"
include: "/views/domain_33/view_11883.view.lkml"
include: "/views/domain_34/view_11884.view.lkml"
include: "/views/domain_35/view_11885.view.lkml"

explore: explore_3960 {
  label: "Explore Explore 3960"
  description: "Comprehensive analytics explore joining base view_11881 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11881
  
  always_filter: {
    filters: [view_11881.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11881.created_at_date: "7 days"]
    unless: [view_11881.id, view_11881.status]
  }

  join: view_11883 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11881.user_id} = ${view_11883.id} ;;
    required_joins: []
  }

  join: view_11884 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11881.account_id} = ${view_11884.account_id} ;;
    required_joins: [view_11883]
  }

  join: view_11885 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11881.category} = ${view_11885.category} ;;
  }

  access_filter: {
    field: view_11881.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11881.is_deleted} = false ;;
}
