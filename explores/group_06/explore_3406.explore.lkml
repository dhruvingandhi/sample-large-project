# Explore: explore_3406
# Auto-generated LookML Explore File

include: "/views/domain_19/view_10219.view.lkml"
include: "/views/domain_21/view_10221.view.lkml"
include: "/views/domain_22/view_10222.view.lkml"
include: "/views/domain_23/view_10223.view.lkml"

explore: explore_3406 {
  label: "Explore Explore 3406"
  description: "Comprehensive analytics explore joining base view_10219 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10219
  
  always_filter: {
    filters: [view_10219.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10219.created_at_date: "7 days"]
    unless: [view_10219.id, view_10219.status]
  }

  join: view_10221 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10219.user_id} = ${view_10221.id} ;;
    required_joins: []
  }

  join: view_10222 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10219.account_id} = ${view_10222.account_id} ;;
    required_joins: [view_10221]
  }

  join: view_10223 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10219.category} = ${view_10223.category} ;;
  }

  access_filter: {
    field: view_10219.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10219.is_deleted} = false ;;
}
