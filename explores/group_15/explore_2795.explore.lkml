# Explore: explore_2795
# Auto-generated LookML Explore File

include: "/views/domain_36/view_08386.view.lkml"
include: "/views/domain_38/view_08388.view.lkml"
include: "/views/domain_39/view_08389.view.lkml"
include: "/views/domain_40/view_08390.view.lkml"

explore: explore_2795 {
  label: "Explore Explore 2795"
  description: "Comprehensive analytics explore joining base view_08386 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08386
  
  always_filter: {
    filters: [view_08386.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08386.created_at_date: "7 days"]
    unless: [view_08386.id, view_08386.status]
  }

  join: view_08388 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08386.user_id} = ${view_08388.id} ;;
    required_joins: []
  }

  join: view_08389 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08386.account_id} = ${view_08389.account_id} ;;
    required_joins: [view_08388]
  }

  join: view_08390 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08386.category} = ${view_08390.category} ;;
  }

  access_filter: {
    field: view_08386.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08386.is_deleted} = false ;;
}
