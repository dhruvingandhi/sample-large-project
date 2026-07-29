# Explore: explore_0689
# Auto-generated LookML Explore File

include: "/views/domain_18/view_02068.view.lkml"
include: "/views/domain_20/view_02070.view.lkml"
include: "/views/domain_21/view_02071.view.lkml"
include: "/views/domain_22/view_02072.view.lkml"

explore: explore_0689 {
  label: "Explore Explore 0689"
  description: "Comprehensive analytics explore joining base view_02068 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02068
  
  always_filter: {
    filters: [view_02068.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02068.created_at_date: "7 days"]
    unless: [view_02068.id, view_02068.status]
  }

  join: view_02070 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02068.user_id} = ${view_02070.id} ;;
    required_joins: []
  }

  join: view_02071 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02068.account_id} = ${view_02071.account_id} ;;
    required_joins: [view_02070]
  }

  join: view_02072 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02068.category} = ${view_02072.category} ;;
  }

  access_filter: {
    field: view_02068.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02068.is_deleted} = false ;;
}
