# Explore: explore_3474
# Auto-generated LookML Explore File

include: "/views/domain_23/view_10423.view.lkml"
include: "/views/domain_25/view_10425.view.lkml"
include: "/views/domain_26/view_10426.view.lkml"
include: "/views/domain_27/view_10427.view.lkml"

explore: explore_3474 {
  label: "Explore Explore 3474"
  description: "Comprehensive analytics explore joining base view_10423 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10423
  
  always_filter: {
    filters: [view_10423.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10423.created_at_date: "7 days"]
    unless: [view_10423.id, view_10423.status]
  }

  join: view_10425 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10423.user_id} = ${view_10425.id} ;;
    required_joins: []
  }

  join: view_10426 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10423.account_id} = ${view_10426.account_id} ;;
    required_joins: [view_10425]
  }

  join: view_10427 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10423.category} = ${view_10427.category} ;;
  }

  access_filter: {
    field: view_10423.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10423.is_deleted} = false ;;
}
