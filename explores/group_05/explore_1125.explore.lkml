# Antigravity modified: branch dg-3
# Explore: explore_1125
# Auto-generated LookML Explore File

include: "/views/domain_26/view_03376.view.lkml"
include: "/views/domain_28/view_03378.view.lkml"
include: "/views/domain_29/view_03379.view.lkml"
include: "/views/domain_30/view_03380.view.lkml"

explore: explore_1125 {
  label: "Explore Explore 1125"
  description: "Comprehensive analytics explore joining base view_03376 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03376
  
  always_filter: {
    filters: [view_03376.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03376.created_at_date: "7 days"]
    unless: [view_03376.id, view_03376.status]
  }

  join: view_03378 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03376.user_id} = ${view_03378.id} ;;
    required_joins: []
  }

  join: view_03379 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03376.account_id} = ${view_03379.account_id} ;;
    required_joins: [view_03378]
  }

  join: view_03380 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03376.category} = ${view_03380.category} ;;
  }

  access_filter: {
    field: view_03376.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03376.is_deleted} = false ;;
}
