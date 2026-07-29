# Explore: explore_0743
# Auto-generated LookML Explore File

include: "/views/domain_30/view_02230.view.lkml"
include: "/views/domain_32/view_02232.view.lkml"
include: "/views/domain_33/view_02233.view.lkml"
include: "/views/domain_34/view_02234.view.lkml"

explore: explore_0743 {
  label: "Explore Explore 0743"
  description: "Comprehensive analytics explore joining base view_02230 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02230
  
  always_filter: {
    filters: [view_02230.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02230.created_at_date: "7 days"]
    unless: [view_02230.id, view_02230.status]
  }

  join: view_02232 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02230.user_id} = ${view_02232.id} ;;
    required_joins: []
  }

  join: view_02233 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02230.account_id} = ${view_02233.account_id} ;;
    required_joins: [view_02232]
  }

  join: view_02234 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02230.category} = ${view_02234.category} ;;
  }

  access_filter: {
    field: view_02230.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02230.is_deleted} = false ;;
}
