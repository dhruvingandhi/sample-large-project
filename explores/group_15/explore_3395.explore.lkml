# Explore: explore_3395
# Auto-generated LookML Explore File

include: "/views/domain_36/view_10186.view.lkml"
include: "/views/domain_38/view_10188.view.lkml"
include: "/views/domain_39/view_10189.view.lkml"
include: "/views/domain_40/view_10190.view.lkml"

explore: explore_3395 {
  label: "Explore Explore 3395"
  description: "Comprehensive analytics explore joining base view_10186 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10186
  
  always_filter: {
    filters: [view_10186.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10186.created_at_date: "7 days"]
    unless: [view_10186.id, view_10186.status]
  }

  join: view_10188 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10186.user_id} = ${view_10188.id} ;;
    required_joins: []
  }

  join: view_10189 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10186.account_id} = ${view_10189.account_id} ;;
    required_joins: [view_10188]
  }

  join: view_10190 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10186.category} = ${view_10190.category} ;;
  }

  access_filter: {
    field: view_10186.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10186.is_deleted} = false ;;
}
