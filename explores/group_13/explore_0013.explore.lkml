# Explore: explore_0013
# Auto-generated LookML Explore File

include: "/views/domain_40/view_00040.view.lkml"
include: "/views/domain_42/view_00042.view.lkml"
include: "/views/domain_43/view_00043.view.lkml"
include: "/views/domain_44/view_00044.view.lkml"

explore: explore_0013 {
  label: "Explore Explore 0013"
  description: "Comprehensive analytics explore joining base view_00040 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00040
  
  always_filter: {
    filters: [view_00040.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00040.created_at_date: "7 days"]
    unless: [view_00040.id, view_00040.status]
  }

  join: view_00042 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00040.user_id} = ${view_00042.id} ;;
    required_joins: []
  }

  join: view_00043 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00040.account_id} = ${view_00043.account_id} ;;
    required_joins: [view_00042]
  }

  join: view_00044 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00040.category} = ${view_00044.category} ;;
  }

  access_filter: {
    field: view_00040.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00040.is_deleted} = false ;;
}
