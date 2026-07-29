# Explore: explore_0715
# Auto-generated LookML Explore File

include: "/views/domain_46/view_02146.view.lkml"
include: "/views/domain_48/view_02148.view.lkml"
include: "/views/domain_49/view_02149.view.lkml"
include: "/views/domain_50/view_02150.view.lkml"

explore: explore_0715 {
  label: "Explore Explore 0715"
  description: "Comprehensive analytics explore joining base view_02146 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02146
  
  always_filter: {
    filters: [view_02146.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02146.created_at_date: "7 days"]
    unless: [view_02146.id, view_02146.status]
  }

  join: view_02148 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02146.user_id} = ${view_02148.id} ;;
    required_joins: []
  }

  join: view_02149 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02146.account_id} = ${view_02149.account_id} ;;
    required_joins: [view_02148]
  }

  join: view_02150 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02146.category} = ${view_02150.category} ;;
  }

  access_filter: {
    field: view_02146.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02146.is_deleted} = false ;;
}
