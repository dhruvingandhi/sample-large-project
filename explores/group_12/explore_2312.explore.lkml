# Explore: explore_2312
# Auto-generated LookML Explore File

include: "/views/domain_37/view_06937.view.lkml"
include: "/views/domain_39/view_06939.view.lkml"
include: "/views/domain_40/view_06940.view.lkml"
include: "/views/domain_41/view_06941.view.lkml"

explore: explore_2312 {
  label: "Explore Explore 2312"
  description: "Comprehensive analytics explore joining base view_06937 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06937
  
  always_filter: {
    filters: [view_06937.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06937.created_at_date: "7 days"]
    unless: [view_06937.id, view_06937.status]
  }

  join: view_06939 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06937.user_id} = ${view_06939.id} ;;
    required_joins: []
  }

  join: view_06940 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06937.account_id} = ${view_06940.account_id} ;;
    required_joins: [view_06939]
  }

  join: view_06941 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06937.category} = ${view_06941.category} ;;
  }

  access_filter: {
    field: view_06937.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06937.is_deleted} = false ;;
}
