# Update for 2000 file diff target
# Explore: explore_3380
# Auto-generated LookML Explore File

include: "/views/domain_41/view_10141.view.lkml"
include: "/views/domain_43/view_10143.view.lkml"
include: "/views/domain_44/view_10144.view.lkml"
include: "/views/domain_45/view_10145.view.lkml"

explore: explore_3380 {
  label: "Explore Explore 3380"
  description: "Comprehensive analytics explore joining base view_10141 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10141
  
  always_filter: {
    filters: [view_10141.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10141.created_at_date: "7 days"]
    unless: [view_10141.id, view_10141.status]
  }

  join: view_10143 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10141.user_id} = ${view_10143.id} ;;
    required_joins: []
  }

  join: view_10144 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10141.account_id} = ${view_10144.account_id} ;;
    required_joins: [view_10143]
  }

  join: view_10145 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10141.category} = ${view_10145.category} ;;
  }

  access_filter: {
    field: view_10141.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10141.is_deleted} = false ;;
}
