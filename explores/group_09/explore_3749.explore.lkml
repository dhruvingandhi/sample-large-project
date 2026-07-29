# Explore: explore_3749
# Auto-generated LookML Explore File

include: "/views/domain_48/view_11248.view.lkml"
include: "/views/domain_50/view_11250.view.lkml"
include: "/views/domain_01/view_11251.view.lkml"
include: "/views/domain_02/view_11252.view.lkml"

explore: explore_3749 {
  label: "Explore Explore 3749"
  description: "Comprehensive analytics explore joining base view_11248 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11248
  
  always_filter: {
    filters: [view_11248.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11248.created_at_date: "7 days"]
    unless: [view_11248.id, view_11248.status]
  }

  join: view_11250 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11248.user_id} = ${view_11250.id} ;;
    required_joins: []
  }

  join: view_11251 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11248.account_id} = ${view_11251.account_id} ;;
    required_joins: [view_11250]
  }

  join: view_11252 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11248.category} = ${view_11252.category} ;;
  }

  access_filter: {
    field: view_11248.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11248.is_deleted} = false ;;
}
