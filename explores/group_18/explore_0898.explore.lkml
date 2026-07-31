# Update for 2000 file diff target
# Explore: explore_0898
# Auto-generated LookML Explore File

include: "/views/domain_45/view_02695.view.lkml"
include: "/views/domain_47/view_02697.view.lkml"
include: "/views/domain_48/view_02698.view.lkml"
include: "/views/domain_49/view_02699.view.lkml"

explore: explore_0898 {
  label: "Explore Explore 0898"
  description: "Comprehensive analytics explore joining base view_02695 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02695
  
  always_filter: {
    filters: [view_02695.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02695.created_at_date: "7 days"]
    unless: [view_02695.id, view_02695.status]
  }

  join: view_02697 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02695.user_id} = ${view_02697.id} ;;
    required_joins: []
  }

  join: view_02698 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02695.account_id} = ${view_02698.account_id} ;;
    required_joins: [view_02697]
  }

  join: view_02699 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02695.category} = ${view_02699.category} ;;
  }

  access_filter: {
    field: view_02695.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02695.is_deleted} = false ;;
}
