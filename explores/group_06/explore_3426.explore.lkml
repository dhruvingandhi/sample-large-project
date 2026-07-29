# Explore: explore_3426
# Auto-generated LookML Explore File

include: "/views/domain_29/view_10279.view.lkml"
include: "/views/domain_31/view_10281.view.lkml"
include: "/views/domain_32/view_10282.view.lkml"
include: "/views/domain_33/view_10283.view.lkml"

explore: explore_3426 {
  label: "Explore Explore 3426"
  description: "Comprehensive analytics explore joining base view_10279 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10279
  
  always_filter: {
    filters: [view_10279.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10279.created_at_date: "7 days"]
    unless: [view_10279.id, view_10279.status]
  }

  join: view_10281 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10279.user_id} = ${view_10281.id} ;;
    required_joins: []
  }

  join: view_10282 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10279.account_id} = ${view_10282.account_id} ;;
    required_joins: [view_10281]
  }

  join: view_10283 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10279.category} = ${view_10283.category} ;;
  }

  access_filter: {
    field: view_10279.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10279.is_deleted} = false ;;
}
