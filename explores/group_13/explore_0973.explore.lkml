# Explore: explore_0973
# Auto-generated LookML Explore File

include: "/views/domain_20/view_02920.view.lkml"
include: "/views/domain_22/view_02922.view.lkml"
include: "/views/domain_23/view_02923.view.lkml"
include: "/views/domain_24/view_02924.view.lkml"

explore: explore_0973 {
  label: "Explore Explore 0973"
  description: "Comprehensive analytics explore joining base view_02920 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02920
  
  always_filter: {
    filters: [view_02920.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02920.created_at_date: "7 days"]
    unless: [view_02920.id, view_02920.status]
  }

  join: view_02922 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02920.user_id} = ${view_02922.id} ;;
    required_joins: []
  }

  join: view_02923 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02920.account_id} = ${view_02923.account_id} ;;
    required_joins: [view_02922]
  }

  join: view_02924 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02920.category} = ${view_02924.category} ;;
  }

  access_filter: {
    field: view_02920.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02920.is_deleted} = false ;;
}
