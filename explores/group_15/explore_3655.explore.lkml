# Explore: explore_3655
# Auto-generated LookML Explore File

include: "/views/domain_16/view_10966.view.lkml"
include: "/views/domain_18/view_10968.view.lkml"
include: "/views/domain_19/view_10969.view.lkml"
include: "/views/domain_20/view_10970.view.lkml"

explore: explore_3655 {
  label: "Explore Explore 3655"
  description: "Comprehensive analytics explore joining base view_10966 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10966
  
  always_filter: {
    filters: [view_10966.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10966.created_at_date: "7 days"]
    unless: [view_10966.id, view_10966.status]
  }

  join: view_10968 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10966.user_id} = ${view_10968.id} ;;
    required_joins: []
  }

  join: view_10969 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10966.account_id} = ${view_10969.account_id} ;;
    required_joins: [view_10968]
  }

  join: view_10970 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10966.category} = ${view_10970.category} ;;
  }

  access_filter: {
    field: view_10966.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10966.is_deleted} = false ;;
}
