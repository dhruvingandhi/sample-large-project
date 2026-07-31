# Update for 2000 file diff target
# Explore: explore_3978
# Auto-generated LookML Explore File

include: "/views/domain_35/view_11935.view.lkml"
include: "/views/domain_37/view_11937.view.lkml"
include: "/views/domain_38/view_11938.view.lkml"
include: "/views/domain_39/view_11939.view.lkml"

explore: explore_3978 {
  label: "Explore Explore 3978"
  description: "Comprehensive analytics explore joining base view_11935 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11935
  
  always_filter: {
    filters: [view_11935.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11935.created_at_date: "7 days"]
    unless: [view_11935.id, view_11935.status]
  }

  join: view_11937 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11935.user_id} = ${view_11937.id} ;;
    required_joins: []
  }

  join: view_11938 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11935.account_id} = ${view_11938.account_id} ;;
    required_joins: [view_11937]
  }

  join: view_11939 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11935.category} = ${view_11939.category} ;;
  }

  access_filter: {
    field: view_11935.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11935.is_deleted} = false ;;
}
