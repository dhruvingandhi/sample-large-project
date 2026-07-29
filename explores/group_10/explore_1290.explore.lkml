# Explore: explore_1290
# Auto-generated LookML Explore File

include: "/views/domain_21/view_03871.view.lkml"
include: "/views/domain_23/view_03873.view.lkml"
include: "/views/domain_24/view_03874.view.lkml"
include: "/views/domain_25/view_03875.view.lkml"

explore: explore_1290 {
  label: "Explore Explore 1290"
  description: "Comprehensive analytics explore joining base view_03871 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03871
  
  always_filter: {
    filters: [view_03871.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03871.created_at_date: "7 days"]
    unless: [view_03871.id, view_03871.status]
  }

  join: view_03873 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03871.user_id} = ${view_03873.id} ;;
    required_joins: []
  }

  join: view_03874 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03871.account_id} = ${view_03874.account_id} ;;
    required_joins: [view_03873]
  }

  join: view_03875 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03871.category} = ${view_03875.category} ;;
  }

  access_filter: {
    field: view_03871.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03871.is_deleted} = false ;;
}
