# Explore: explore_3405
# Auto-generated LookML Explore File

include: "/views/domain_16/view_10216.view.lkml"
include: "/views/domain_18/view_10218.view.lkml"
include: "/views/domain_19/view_10219.view.lkml"
include: "/views/domain_20/view_10220.view.lkml"

explore: explore_3405 {
  label: "Explore Explore 3405"
  description: "Comprehensive analytics explore joining base view_10216 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10216
  
  always_filter: {
    filters: [view_10216.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10216.created_at_date: "7 days"]
    unless: [view_10216.id, view_10216.status]
  }

  join: view_10218 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10216.user_id} = ${view_10218.id} ;;
    required_joins: []
  }

  join: view_10219 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10216.account_id} = ${view_10219.account_id} ;;
    required_joins: [view_10218]
  }

  join: view_10220 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10216.category} = ${view_10220.category} ;;
  }

  access_filter: {
    field: view_10216.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10216.is_deleted} = false ;;
}
