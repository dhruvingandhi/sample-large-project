# Update for 500 file diff target
# Explore: explore_1382
# Auto-generated LookML Explore File

include: "/views/domain_47/view_04147.view.lkml"
include: "/views/domain_49/view_04149.view.lkml"
include: "/views/domain_50/view_04150.view.lkml"
include: "/views/domain_01/view_04151.view.lkml"

explore: explore_1382 {
  label: "Explore Explore 1382"
  description: "Comprehensive analytics explore joining base view_04147 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04147
  
  always_filter: {
    filters: [view_04147.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04147.created_at_date: "7 days"]
    unless: [view_04147.id, view_04147.status]
  }

  join: view_04149 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04147.user_id} = ${view_04149.id} ;;
    required_joins: []
  }

  join: view_04150 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04147.account_id} = ${view_04150.account_id} ;;
    required_joins: [view_04149]
  }

  join: view_04151 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04147.category} = ${view_04151.category} ;;
  }

  access_filter: {
    field: view_04147.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04147.is_deleted} = false ;;
}
