# Explore: explore_3631
# Auto-generated LookML Explore File

include: "/views/domain_44/view_10894.view.lkml"
include: "/views/domain_46/view_10896.view.lkml"
include: "/views/domain_47/view_10897.view.lkml"
include: "/views/domain_48/view_10898.view.lkml"

explore: explore_3631 {
  label: "Explore Explore 3631"
  description: "Comprehensive analytics explore joining base view_10894 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10894
  
  always_filter: {
    filters: [view_10894.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10894.created_at_date: "7 days"]
    unless: [view_10894.id, view_10894.status]
  }

  join: view_10896 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10894.user_id} = ${view_10896.id} ;;
    required_joins: []
  }

  join: view_10897 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10894.account_id} = ${view_10897.account_id} ;;
    required_joins: [view_10896]
  }

  join: view_10898 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10894.category} = ${view_10898.category} ;;
  }

  access_filter: {
    field: view_10894.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10894.is_deleted} = false ;;
}
