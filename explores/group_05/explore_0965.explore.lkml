# Antigravity modified: branch dg-3
# Explore: explore_0965
# Auto-generated LookML Explore File

include: "/views/domain_46/view_02896.view.lkml"
include: "/views/domain_48/view_02898.view.lkml"
include: "/views/domain_49/view_02899.view.lkml"
include: "/views/domain_50/view_02900.view.lkml"

explore: explore_0965 {
  label: "Explore Explore 0965"
  description: "Comprehensive analytics explore joining base view_02896 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02896
  
  always_filter: {
    filters: [view_02896.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02896.created_at_date: "7 days"]
    unless: [view_02896.id, view_02896.status]
  }

  join: view_02898 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02896.user_id} = ${view_02898.id} ;;
    required_joins: []
  }

  join: view_02899 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02896.account_id} = ${view_02899.account_id} ;;
    required_joins: [view_02898]
  }

  join: view_02900 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02896.category} = ${view_02900.category} ;;
  }

  access_filter: {
    field: view_02896.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02896.is_deleted} = false ;;
}
