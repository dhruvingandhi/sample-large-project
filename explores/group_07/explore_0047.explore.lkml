# Explore: explore_0047
# Auto-generated LookML Explore File

include: "/views/domain_42/view_00142.view.lkml"
include: "/views/domain_44/view_00144.view.lkml"
include: "/views/domain_45/view_00145.view.lkml"
include: "/views/domain_46/view_00146.view.lkml"

explore: explore_0047 {
  label: "Explore Explore 0047"
  description: "Comprehensive analytics explore joining base view_00142 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00142
  
  always_filter: {
    filters: [view_00142.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00142.created_at_date: "7 days"]
    unless: [view_00142.id, view_00142.status]
  }

  join: view_00144 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00142.user_id} = ${view_00144.id} ;;
    required_joins: []
  }

  join: view_00145 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00142.account_id} = ${view_00145.account_id} ;;
    required_joins: [view_00144]
  }

  join: view_00146 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00142.category} = ${view_00146.category} ;;
  }

  access_filter: {
    field: view_00142.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00142.is_deleted} = false ;;
}
