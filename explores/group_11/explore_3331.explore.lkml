# Explore: explore_3331
# Auto-generated LookML Explore File

include: "/views/domain_44/view_09994.view.lkml"
include: "/views/domain_46/view_09996.view.lkml"
include: "/views/domain_47/view_09997.view.lkml"
include: "/views/domain_48/view_09998.view.lkml"

explore: explore_3331 {
  label: "Explore Explore 3331"
  description: "Comprehensive analytics explore joining base view_09994 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09994
  
  always_filter: {
    filters: [view_09994.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09994.created_at_date: "7 days"]
    unless: [view_09994.id, view_09994.status]
  }

  join: view_09996 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09994.user_id} = ${view_09996.id} ;;
    required_joins: []
  }

  join: view_09997 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09994.account_id} = ${view_09997.account_id} ;;
    required_joins: [view_09996]
  }

  join: view_09998 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09994.category} = ${view_09998.category} ;;
  }

  access_filter: {
    field: view_09994.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09994.is_deleted} = false ;;
}
