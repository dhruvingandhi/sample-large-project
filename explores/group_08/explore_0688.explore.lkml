# Explore: explore_0688
# Auto-generated LookML Explore File

include: "/views/domain_15/view_02065.view.lkml"
include: "/views/domain_17/view_02067.view.lkml"
include: "/views/domain_18/view_02068.view.lkml"
include: "/views/domain_19/view_02069.view.lkml"

explore: explore_0688 {
  label: "Explore Explore 0688"
  description: "Comprehensive analytics explore joining base view_02065 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02065
  
  always_filter: {
    filters: [view_02065.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02065.created_at_date: "7 days"]
    unless: [view_02065.id, view_02065.status]
  }

  join: view_02067 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02065.user_id} = ${view_02067.id} ;;
    required_joins: []
  }

  join: view_02068 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02065.account_id} = ${view_02068.account_id} ;;
    required_joins: [view_02067]
  }

  join: view_02069 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02065.category} = ${view_02069.category} ;;
  }

  access_filter: {
    field: view_02065.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02065.is_deleted} = false ;;
}
