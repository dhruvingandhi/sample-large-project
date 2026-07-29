# Explore: explore_0413
# Auto-generated LookML Explore File

include: "/views/domain_40/view_01240.view.lkml"
include: "/views/domain_42/view_01242.view.lkml"
include: "/views/domain_43/view_01243.view.lkml"
include: "/views/domain_44/view_01244.view.lkml"

explore: explore_0413 {
  label: "Explore Explore 0413"
  description: "Comprehensive analytics explore joining base view_01240 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01240
  
  always_filter: {
    filters: [view_01240.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01240.created_at_date: "7 days"]
    unless: [view_01240.id, view_01240.status]
  }

  join: view_01242 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01240.user_id} = ${view_01242.id} ;;
    required_joins: []
  }

  join: view_01243 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01240.account_id} = ${view_01243.account_id} ;;
    required_joins: [view_01242]
  }

  join: view_01244 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01240.category} = ${view_01244.category} ;;
  }

  access_filter: {
    field: view_01240.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01240.is_deleted} = false ;;
}
