# Explore: explore_1693
# Auto-generated LookML Explore File

include: "/views/domain_30/view_05080.view.lkml"
include: "/views/domain_32/view_05082.view.lkml"
include: "/views/domain_33/view_05083.view.lkml"
include: "/views/domain_34/view_05084.view.lkml"

explore: explore_1693 {
  label: "Explore Explore 1693"
  description: "Comprehensive analytics explore joining base view_05080 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05080
  
  always_filter: {
    filters: [view_05080.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05080.created_at_date: "7 days"]
    unless: [view_05080.id, view_05080.status]
  }

  join: view_05082 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05080.user_id} = ${view_05082.id} ;;
    required_joins: []
  }

  join: view_05083 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05080.account_id} = ${view_05083.account_id} ;;
    required_joins: [view_05082]
  }

  join: view_05084 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05080.category} = ${view_05084.category} ;;
  }

  access_filter: {
    field: view_05080.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05080.is_deleted} = false ;;
}
