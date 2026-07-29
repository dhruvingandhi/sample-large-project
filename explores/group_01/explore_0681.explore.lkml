# Explore: explore_0681
# Auto-generated LookML Explore File

include: "/views/domain_44/view_02044.view.lkml"
include: "/views/domain_46/view_02046.view.lkml"
include: "/views/domain_47/view_02047.view.lkml"
include: "/views/domain_48/view_02048.view.lkml"

explore: explore_0681 {
  label: "Explore Explore 0681"
  description: "Comprehensive analytics explore joining base view_02044 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02044
  
  always_filter: {
    filters: [view_02044.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02044.created_at_date: "7 days"]
    unless: [view_02044.id, view_02044.status]
  }

  join: view_02046 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02044.user_id} = ${view_02046.id} ;;
    required_joins: []
  }

  join: view_02047 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02044.account_id} = ${view_02047.account_id} ;;
    required_joins: [view_02046]
  }

  join: view_02048 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02044.category} = ${view_02048.category} ;;
  }

  access_filter: {
    field: view_02044.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02044.is_deleted} = false ;;
}
