# Explore: explore_3478
# Auto-generated LookML Explore File

include: "/views/domain_35/view_10435.view.lkml"
include: "/views/domain_37/view_10437.view.lkml"
include: "/views/domain_38/view_10438.view.lkml"
include: "/views/domain_39/view_10439.view.lkml"

explore: explore_3478 {
  label: "Explore Explore 3478"
  description: "Comprehensive analytics explore joining base view_10435 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10435
  
  always_filter: {
    filters: [view_10435.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10435.created_at_date: "7 days"]
    unless: [view_10435.id, view_10435.status]
  }

  join: view_10437 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10435.user_id} = ${view_10437.id} ;;
    required_joins: []
  }

  join: view_10438 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10435.account_id} = ${view_10438.account_id} ;;
    required_joins: [view_10437]
  }

  join: view_10439 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10435.category} = ${view_10439.category} ;;
  }

  access_filter: {
    field: view_10435.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10435.is_deleted} = false ;;
}
