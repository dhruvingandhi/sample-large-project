# Explore: explore_3745
# Auto-generated LookML Explore File

include: "/views/domain_36/view_11236.view.lkml"
include: "/views/domain_38/view_11238.view.lkml"
include: "/views/domain_39/view_11239.view.lkml"
include: "/views/domain_40/view_11240.view.lkml"

explore: explore_3745 {
  label: "Explore Explore 3745"
  description: "Comprehensive analytics explore joining base view_11236 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11236
  
  always_filter: {
    filters: [view_11236.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11236.created_at_date: "7 days"]
    unless: [view_11236.id, view_11236.status]
  }

  join: view_11238 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11236.user_id} = ${view_11238.id} ;;
    required_joins: []
  }

  join: view_11239 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11236.account_id} = ${view_11239.account_id} ;;
    required_joins: [view_11238]
  }

  join: view_11240 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11236.category} = ${view_11240.category} ;;
  }

  access_filter: {
    field: view_11236.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11236.is_deleted} = false ;;
}
