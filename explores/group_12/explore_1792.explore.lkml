# Explore: explore_1792
# Auto-generated LookML Explore File

include: "/views/domain_27/view_05377.view.lkml"
include: "/views/domain_29/view_05379.view.lkml"
include: "/views/domain_30/view_05380.view.lkml"
include: "/views/domain_31/view_05381.view.lkml"

explore: explore_1792 {
  label: "Explore Explore 1792"
  description: "Comprehensive analytics explore joining base view_05377 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05377
  
  always_filter: {
    filters: [view_05377.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05377.created_at_date: "7 days"]
    unless: [view_05377.id, view_05377.status]
  }

  join: view_05379 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05377.user_id} = ${view_05379.id} ;;
    required_joins: []
  }

  join: view_05380 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05377.account_id} = ${view_05380.account_id} ;;
    required_joins: [view_05379]
  }

  join: view_05381 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05377.category} = ${view_05381.category} ;;
  }

  access_filter: {
    field: view_05377.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05377.is_deleted} = false ;;
}
